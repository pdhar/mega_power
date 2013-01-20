# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Morris.Line
    element: 'equipmentreport'
    data: $('#equipmentreport').data('monthlydata')
    xkey: 'month'
    ykeys: ['total_service_cost','total_service_parts','total_service_labour']
    labels: ['Total Service Cost','Total Service Parts','Total Service Labour']
    xLabels: "month"
    


