`timescale 1ns/1ps

module tb_mux_4to1;

    // Inputs
    reg [3:0] d;
    reg [1:0] s;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_4to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        d = 4'b1010; // Inputs are 1, 0, 1, 0
        s = 2'b00;   // Select input 0
        #10;
        if (y !== d[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", d[0], y);

        // Test case 2: Select input 1
        s = 2'b01;   // Select input 1
        #10;
        if (y !== d[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", d[1], y);

        // Test case 3: Select input 2
        s = 2'b10;   // Select input 2
        #10;
        if (y !== d[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", d[2], y);

        // Test case 4: Select input 3
        s = 2'b11;   // Select input 3
        #10;
        if (y !== d[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", d[3], y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule