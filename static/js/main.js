let myChart = null;

function sendQuery() {
  const question = document.getElementById('userInput').value.trim();
  if (!question) {
    alert('Please enter a question.');
    return;
  }

  fetch('/ask-query', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ question })
  })
    .then(res => res.json())
    .then(data => {
      document.getElementById('resultsContainer').style.display = 'block';
      document.getElementById('sqlQuery').textContent = data.sql_query;

      // History
      const li = document.createElement('li');
      li.textContent = question;
      document.getElementById('historyList').appendChild(li);

      // Table
      const tableHead = document.getElementById('tableHead');
      const tableBody = document.getElementById('tableBody');
      tableHead.innerHTML = '';
      tableBody.innerHTML = '';

      if (data.table_data && data.table_data.length > 0) {
        const headers = Object.keys(data.table_data[0]);
        tableHead.innerHTML = `<tr>${headers.map(h => `<th>${h}</th>`).join('')}</tr>`;
        data.table_data.forEach(row => {
          tableBody.innerHTML += `<tr>${headers.map(h => `<td>${row[h]}</td>`).join('')}</tr>`;
        });
      }

      // Chart
      if (myChart) {
        myChart.destroy();
        myChart = null;
      }

      if (data.chart_type && data.chart_data.labels.length > 0) {
        const ctx = document.getElementById('resultChart').getContext('2d');
        myChart = new Chart(ctx, {
          type: data.chart_type,
          data: {
            labels: data.chart_data.labels,
            datasets: [{
              label: 'Query Result',
              data: data.chart_data.data,
              backgroundColor: 'rgba(54, 162, 235, 0.5)',
              borderColor: 'rgba(54, 162, 235, 1)',
              borderWidth: 1
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: true,
            scales: {
              y: { beginAtZero: true }
            }
          }
        });
      }
    })
    .catch(err => {
      console.error(err);
      alert('An error occurred. Please check console.');
    });
}

function downloadAll() {
  const zip = new JSZip();

  const sql = document.getElementById('sqlQuery').textContent;
  zip.file('query.sql', sql);

  let csv = '';
  const headers = [...document.querySelectorAll('#tableHead th')].map(th => th.textContent).join(',');
  const rows = [...document.querySelectorAll('#tableBody tr')].map(tr =>
    [...tr.querySelectorAll('td')].map(td => td.textContent).join(',')
  );
  csv += headers + '\n' + rows.join('\n');
  zip.file('data.csv', csv);

  zip.generateAsync({ type: 'blob' }).then(content => {
    const a = document.createElement('a');
    a.href = URL.createObjectURL(content);
    a.download = 'query_result.zip';
    a.click();
  });
}
