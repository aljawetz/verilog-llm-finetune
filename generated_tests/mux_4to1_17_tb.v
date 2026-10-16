`timescale 1ns/1ps

module tb_mux_4to1;

    reg [3:0] d;
    reg [1:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_4to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        d = 4'b1010; // Inputs: d[0]=0, d[1]=1, d[2]=0, d[3]=1
        s = 2'b00;   // Select line
        #10;         // Wait for 10 time units
        if (y !== d[0]) $display("FAIL: Expected y=%b but got y=%b for s=%b", d[0], y, s);

        // Test case 2: Select input 1
        s = 2'b01;   // Select line
        #10;         // Wait for 10 time units
        if (y !== d[1]) $display("FAIL: Expected y=%b but got y=%b for s=%b", d[1], y, s);

        // Test case 3: Select input 2
        s = 2'b10;   // Select line
        #10;         // Wait for 10 time units
        if (y !== d[2]) $display("FAIL: Expected y=%b but got y=%b for s=%b", d[2], y, s);

        // Test case 4: Select input 3
        s = 2'b11;   // Select line
        #10;         // Wait for 10 time units
        if (y !== d[3]) $display("FAIL: Expected y=%b but got y=%b for s=%b", d[3], y, s);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule