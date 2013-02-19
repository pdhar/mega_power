# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#equipments').dataTable
    bJQueryUI: true
  
  Morris.Line
    element: 'equipmentreport'
    data: $('#equipmentreport').data('monthlydata')
    xkey: 'month'
    ykeys: ['total_service_cost','total_service_parts','total_service_labour']
    labels: ['Total Service Cost','Total Service Parts','Total Service Labour']
    xLabels: "month"
    

  Morris.Line
    element: 'equipmentreport2'
    data: $('#equipmentreport2').data('monthlydata')
    xkey: 'month'
    ykeys: ['total_break_cost','total_break_parts','total_break_labour']
    labels: ['Total Breakdown Cost','Total Breakdown Parts','Total Breakdown Labour']
    lineColors: ['red','orange','blue']
    xLabels: "month"

  Morris.Line
    element: 'equipmentreport3'
    data: $('#equipmentreport3').data('monthlydata')
    xkey: 'month'
    ykeys: ['total_offhire_hrs','total_total_hrs']
    labels: ['Working hrs Running Total','Working hrs monthly']
    lineColors: ['brown','purple']
    xLabels: "month"  