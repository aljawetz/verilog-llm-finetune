`timescale 1ns/1ps

module tb_MUX_st;

    reg [7:0] a;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test (uut)
    MUX_st uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        a = 8'b10101010; // Input data
        s = 3'b000;     // Select line for input 0
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select input 1
        s = 3'b001;     // Select line for input 1
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

        // Test case 3: Select input 2
        s = 3'b010;     // Select line for input 2
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: Select input 3
        s = 3'b011;     // Select line for input 3
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

        // Test case 5: Select input 4
        s = 3'b100;     // Select line for input 4
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // Test case 6: Select input 5
        s = 3'b101;     // Select line for input 5
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

        // Test case 7: Select input 6
        s = 3'b110;     // Select line for input 6
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

        // Test case 8: Select input 7
        s = 3'b111;     // Select line for input 7
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 8 failed, expected y=0, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule