`timescale 1ns/1ps

module tb_mux4to1;

    reg [3:0] a;
    reg [1:0] sel;
    wire y;

    // Instantiate the module under test (uut)
    mux4to1 uut (
        .a(a),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        a = 4'b1010; // Input values
        sel = 2'b00; // Select first input
        #10; // Wait for 10 time units
        if (y !== a[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", a[0], y);
            $finish;
        end

        // Test case 2: Select input 1
        sel = 2'b01; // Select second input
        #10; // Wait for 10 time units
        if (y !== a[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", a[1], y);
            $finish;
        end

        // Test case 3: Select input 2
        sel = 2'b10; // Select third input
        #10; // Wait for 10 time units
        if (y !== a[2]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", a[2], y);
            $finish;
        end

        // Test case 4: Select input 3
        sel = 2'b11; // Select fourth input
        #10; // Wait for 10 time units
        if (y !== a[3]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", a[3], y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule