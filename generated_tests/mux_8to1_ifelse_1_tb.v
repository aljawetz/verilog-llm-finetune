`timescale 1ns/1ps

module tb_mux_8to1_ifelse;

    reg [7:0] d_in;
    reg [2:0] sel_in;
    wire y_out;

    // Instantiate the module under test (uut)
    mux_8to1_ifelse uut (
        .d_in(d_in),
        .sel_in(sel_in),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: Select d_in[0]
        d_in = 8'b10101010; // d_in = 0xAA
        sel_in = 3'b000;    // Select first bit
        #10;
        if (y_out !== d_in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", d_in[0], y_out);
            $finish;
        end

        // Test case 2: Select d_in[1]
        sel_in = 3'b001;    // Select second bit
        #10;
        if (y_out !== d_in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", d_in[1], y_out);
            $finish;
        end

        // Test case 3: Select d_in[2]
        sel_in = 3'b010;    // Select third bit
        #10;
        if (y_out !== d_in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", d_in[2], y_out);
            $finish;
        end

        // Test case 4: Select d_in[3]
        sel_in = 3'b011;    // Select fourth bit
        #10;
        if (y_out !== d_in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", d_in[3], y_out);
            $finish;
        end

        // Test case 5: Select d_in[4]
        sel_in = 3'b100;    // Select fifth bit
        #10;
        if (y_out !== d_in[4]) begin
            $display("FAIL: Test case 5 failed, expected %b but got %b", d_in[4], y_out);
            $finish;
        end

        // Test case 6: Select d_in[5]
        sel_in = 3'b101;    // Select sixth bit
        #10;
        if (y_out !== d_in[5]) begin
            $display("FAIL: Test case 6 failed, expected %b but got %b", d_in[5], y_out);
            $finish;
        end

        // Test case 7: Select d_in[6]
        sel_in = 3'b110;    // Select seventh bit
        #10;
        if (y_out !== d_in[6]) begin
            $display("FAIL: Test case 7 failed, expected %b but got %b", d_in[6], y_out);
            $finish;
        end

        // Test case 8: Select d_in[7]
        sel_in = 3'b111;    // Select eighth bit
        #10;
        if (y_out !== d_in[7]) begin
            $display("FAIL: Test case 8 failed, expected %b but got %b", d_in[7], y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule