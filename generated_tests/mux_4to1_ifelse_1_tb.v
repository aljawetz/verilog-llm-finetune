`timescale 1ns/1ps

module tb_mux_4to1_ifelse;

    reg [3:0] d_in;
    reg [1:0] sel_in;
    wire y_out;

    // Instantiate the module under test (uut)
    mux_4to1_ifelse uut (
        .d_in(d_in),
        .sel_in(sel_in),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: Select input 0
        d_in = 4'b1010; // Inputs: 0=1, 1=0, 2=1, 3=0
        sel_in = 2'b00; // Select input 0
        #10;
        if (y_out !== d_in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", d_in[0], y_out);
            $finish;
        end

        // Test case 2: Select input 1
        sel_in = 2'b01; // Select input 1
        #10;
        if (y_out !== d_in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", d_in[1], y_out);
            $finish;
        end

        // Test case 3: Select input 2
        sel_in = 2'b10; // Select input 2
        #10;
        if (y_out !== d_in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", d_in[2], y_out);
            $finish;
        end

        // Test case 4: Select input 3
        sel_in = 2'b11; // Select input 3
        #10;
        if (y_out !== d_in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", d_in[3], y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule