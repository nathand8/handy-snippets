function getTiming(fn, iterations) {
    if (!iterations) {
        iterations = 1000;
    }
    var start = window.performance.now();
    for (var i = 0; i < iterations; i++) {
        fn();
    }
    var end = window.performance.now();
    var duration = end - start
    console.log("functionTiming:", duration, "milliseconds over", iterations, "iterations. Average per iteration:", duration/iterations, "milliseconds")
}

console.log("Usage: getTiming(function() { /* do something */ })");
console.log("Usage: getTiming(fn, 1000) // Run it 1000 times");
