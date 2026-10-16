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
        d = 4'b1010; // d[0] = 0
        s = 2'b00; 
        #10;
        if (y !== d[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", d[0], y);
            $finish;
        end

        // Test case 2: Select input 1
        s = 2'b01; 
        #10;
        if (y !== d[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", d[1], y);
            $finish;
        end

        // Test case 3: Select input 2
        s = 2'b10; 
        #10;
        if (y !== d[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", d[2], y);
            $finish;
        end

        // Test case 4: Select input 3
        s = 2'b11; 
        #10;
        if (y !== d[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", d[3], y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule