//Brands Start
function retailDashboardCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, sellService) {

    init();

    function init() {
        loadLineCharts();
    }

    function loadLineCharts() {
        var revenueChart = c3.generate({
            bindto: '#revenueChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['revenue', 0, 0, 0, 500, 0, 1000]
                ],
                axes: {
                    'revenue': 'y'
                },
                type: 'bar',
                types: {
                    revenue: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //Sales Count Chart
        var saleCountChart = c3.generate({
            bindto: '#saleCountChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['salecount', 0, 0, 0, 1, 0, 2]
                ],
                axes: {
                    'salecount': 'y'
                },
                type: 'bar',
                types: {
                    salecount: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //Customer Count chart
        var customerCountChart = c3.generate({
            bindto: '#customerCountChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['customercount', 0, 0, 0, 1, 0, 2]
                ],
                axes: {
                    'customercount': 'y'
                },
                type: 'bar',
                types: {
                    customercount: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //gross profit chart
        var grossProfitChart = c3.generate({
            bindto: '#grossProfitChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['grossprofit', 0, 0, 0, 450, 0, 900]
                ],
                axes: {
                    'grossprofit': 'y'
                },
                type: 'bar',
                types: {
                    grossprofit: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //discount chart
        var discountChart = c3.generate({
            bindto: '#discountChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['discount', 0, 0, 0, 50, 0, 100]
                ],
                axes: {
                    'discount': 'y'
                },
                type: 'bar',
                types: {
                    discount: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //discount percent chart
        var discountPercentChart = c3.generate({
            bindto: '#discountPercentChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['discountpercent', 0, 0, 0, 10, 0, 20]
                ],
                axes: {
                    'discountpercent': 'y'
                },
                type: 'bar',
                types: {
                    discountpercent: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //basket value chart
        var basketValueChart = c3.generate({
            bindto: '#basketValueChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['basketvalue', 0, 0, 0, 500, 0, 1000]
                ],
                axes: {
                    'basketvalue': 'y'
                },
                type: 'bar',
                types: {
                    basketvalue: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        //basket size chat
        var basketSizeChart = c3.generate({
            bindto: '#basketSizeChart',
            data: {
                x: 'x',
                columns: [
                    ['x', '2017-11-26', '2017-11-27', '2017-11-28', '2017-11-29', '2017-11-30', '2017-12-01'],
                    ['basketsize', 0, 0, 0, 1, 0, 2]
                ],
                axes: {
                    'basketsize': 'y'
                },
                type: 'bar',
                types: {
                    basketsize: 'line'
                },
            },
            zoom: {
                enabled: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        format: function (d) {
                            var dayName = d.toString().split(' ')[0];
                            return dayName + ' ' + d.getDate();
                        }
                    }
                }
            }
        });

        $scope.lineDataDashboard4 = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "Example dataset",
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 40, 51, 36, 25, 40]
                },
                {
                    label: "Example dataset",
                    fillColor: "rgba(26,179,148,0.5)",
                    strokeColor: "rgba(26,179,148,0.7)",
                    pointColor: "rgba(26,179,148,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [48, 48, 60, 39, 56, 37, 30]
                }
            ]
        };
        /**
 * Options for Line chart
 */
        $scope.lineOptions = {
            scaleShowGridLines: true,
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleGridLineWidth: 1,
            bezierCurve: true,
            bezierCurveTension: 0.4,
            pointDot: true,
            pointDotRadius: 4,
            pointDotStrokeWidth: 1,
            pointHitDetectionRadius: 20,
            datasetStroke: true,
            datasetStrokeWidth: 2,
            datasetFill: true
        };
    }

};
