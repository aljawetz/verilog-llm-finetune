`timescale 1ns/1ps

module tb_mux_16to1_behavioral;

    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_16to1_behavioral uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test sequence
        // Test case 1: Select 0th bit
        in = 16'b1010101010101010; // Input pattern
        sel = 4'b0000; // Select 0
        #10;
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);
            $finish;
        end

        // Test case 2: Select 1st bit
        sel = 4'b0001; // Select 1
        #10;
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);
            $finish;
        end

        // Test case 3: Select 2nd bit
        sel = 4'b0010; // Select 2
        #10;
        if (out !== in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);
            $finish;
        end

        // Test case 4: Select 3rd bit
        sel = 4'b0011; // Select 3
        #10;
        if (out !== in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);
            $finish;
        end

        // Test case 5: Select 4th bit
        sel = 4'b0100; // Select 4
        #10;
        if (out !== in[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);
            $finish;
        end

        // Test case 6: Select 15th bit
        sel = 4'b1111; // Select 15
        #10;
        if (out !== in[15]) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", in[15], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule