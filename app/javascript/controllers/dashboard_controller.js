import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = { patientCreations: Array }

  initialize() {
    const data = this.patientCreationsValue.map((item) => item[1]);
    const labels = this.patientCreationsValue.map((item) => item[0]);

    const ctx = document.getElementById('patientCreationsChart');

    new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'Number of Patient Creations',
          data: data,
          borderWidth: 3,
          fill: true
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        scales: {
          x: {
            title: {
              display: true,
              text: 'Date of creation' // Label for the x-axis
            },
            grid: {
              display: false
            }
          },
          y: {
            title: {
              display: true,
              text: 'Number of patients' // Label for the y-axis
            },
            border: {
              dash: [5, 5]
            },
            grid: {
              color: "#d4f3ef"
            },
            beginAtZero: true,
            ticks: {
              stepSize: 1,

              precision: 0
            }
          }
        }
      }
    });
  }
}


