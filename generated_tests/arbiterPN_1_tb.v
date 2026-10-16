`timescale 1ns/1ps

module tb_arbiterPN;

parameter TIME_WIDTH = 8;
parameter MAX_TIME = 'h1;

reg [TIME_WIDTH-1:0] time0;
reg [TIME_WIDTH-1:0] time1;
reg mode;
wire swap;

// Instantiate the module under test
arbiterPN uut (
    .time0(time0),
    .time1(time1),
    .mode(mode),
    .swap(swap)
);

initial begin
    // Test case 1: time0 = 0, time1 = 5, mode = 0
    time0 = 0; time1 = 5; mode = 0;
    #10;
    if (swap !== 1) $display("FAIL: Test case 1 failed"); // Expected swap = 1
    else $display("Test case 1 passed");

    // Test case 2: time0 = 5, time1 = 0, mode = 1
    time0 = 5; time1 = 0; mode = 1;
    #10;
    if (swap !== 1) $display("FAIL: Test case 2 failed"); // Expected swap = 1
    else $display("Test case 2 passed");

    // Test case 3: time0 = 5, time1 = 10, mode = 0
    time0 = 5; time1 = 10; mode = 0;
    #10;
    if (swap !== 0) $display("FAIL: Test case 3 failed"); // Expected swap = 0
    else $display("Test case 3 passed");

    // Test case 4: time0 = 10, time1 = 5, mode = 1
    time0 = 10; time1 = 5; mode = 1;
    #10;
    if (swap !== 0) $display("FAIL: Test case 4 failed"); // Expected swap = 0
    else $display("Test case 4 passed");

    // Test case 5: time0 = 0, time1 = 0, mode = 0
    time0 = 0; time1 = 0; mode = 0;
    #10;
    if (swap !== 1) $display("FAIL: Test case 5 failed"); // Expected swap = 1
    else $display("Test case 5 passed");

    // Test case 6: time0 = 0, time1 = 0, mode = 1
    time0 = 0; time1 = 0; mode = 1;
    #10;
    if (swap !== 1) $display("FAIL: Test case 6 failed"); // Expected swap = 1
    else $display("Test case 6 passed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule