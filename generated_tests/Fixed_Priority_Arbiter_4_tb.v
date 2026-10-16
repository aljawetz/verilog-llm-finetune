`timescale 1ns/1ps

module tb_Fixed_Priority_Arbiter;

    reg [3:0] Request;
    wire [3:0] Grant;

    // Instantiate the Unit Under Test (UUT)
    Fixed_Priority_Arbiter uut (
        .Request(Request),
        .Grant(Grant)
    );

    initial begin
        // Test case 1: Only the highest priority request is active
        Request = 4'b1000; // Request 3
        #10;
        if (Grant !== 4'b1000) $display("FAIL: Test case 1 failed, expected Grant = 4'b1000, got Grant = %b", Grant);

        // Test case 2: Lower priority request is active
        Request = 4'b0100; // Request 2
        #10;
        if (Grant !== 4'b0100) $display("FAIL: Test case 2 failed, expected Grant = 4'b0100, got Grant = %b", Grant);

        // Test case 3: Multiple requests, highest priority should be granted
        Request = 4'b1100; // Requests 2 and 3
        #10;
        if (Grant !== 4'b1000) $display("FAIL: Test case 3 failed, expected Grant = 4'b1000, got Grant = %b", Grant);

        // Test case 4: All requests active, highest priority should be granted
        Request = 4'b1111; // Requests 0, 1, 2, and 3
        #10;
        if (Grant !== 4'b1000) $display("FAIL: Test case 4 failed, expected Grant = 4'b1000, got Grant = %b", Grant);

        // Test case 5: No requests active
        Request = 4'b0000; // No requests
        #10;
        if (Grant !== 4'b0000) $display("FAIL: Test case 5 failed, expected Grant = 4'b0000, got Grant = %b", Grant);

        // Test case 6: Lower priority request with higher priority inactive
        Request = 4'b0010; // Request 1
        #10;
        if (Grant !== 4'b0010) $display("FAIL: Test case 6 failed, expected Grant = 4'b0010, got Grant = %b", Grant);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule