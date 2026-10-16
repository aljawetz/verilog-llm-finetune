`timescale 1ns/1ps

module tb_mux_4to1;

    reg [3:0] d_in;
    reg [1:0] sel_in;
    wire out;

    // Instantiate the module under test (uut)
    mux_4to1 uut (
        .d_in(d_in),
        .sel_in(sel_in),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        d_in = 4'b1010; // d_in = 10
        sel_in = 2'b00; // Select d_in[0]
        #10;
        if (out !== d_in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", d_in[0], out);
            $finish;
        end

        // Test case 2: Select input 1
        sel_in = 2'b01; // Select d_in[1]
        #10;
        if (out !== d_in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", d_in[1], out);
            $finish;
        end

        // Test case 3: Select input 2
        sel_in = 2'b10; // Select d_in[2]
        #10;
        if (out !== d_in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", d_in[2], out);
            $finish;
        end

        // Test case 4: Select input 3
        sel_in = 2'b11; // Select d_in[3]
        #10;
        if (out !== d_in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", d_in[3], out);
            $finish;
        end

        // Test case 5: Check default case
        d_in = 4'b0000; // d_in = 0
        sel_in = 2'bxx; // Should default to d_in[0]
        #10;
        if (out !== d_in[0]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", d_in[0], out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule