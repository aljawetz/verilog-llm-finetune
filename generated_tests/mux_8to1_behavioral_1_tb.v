`timescale 1ns/1ps

module tb_mux_8to1_behavioral;

    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_8to1_behavioral uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test sequence
        // Test case 1: Select 0
        in = 8'b10101010; // Input data
        sel = 3'b000;    // Select the first bit
        #10;             // Wait for 10 time units
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);
            $finish;
        end

        // Test case 2: Select 1
        sel = 3'b001;    // Select the second bit
        #10;
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);
            $finish;
        end

        // Test case 3: Select 2
        sel = 3'b010;    // Select the third bit
        #10;
        if (out !== in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);
            $finish;
        end

        // Test case 4: Select 3
        sel = 3'b011;    // Select the fourth bit
        #10;
        if (out !== in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);
            $finish;
        end

        // Test case 5: Select 4
        sel = 3'b100;    // Select the fifth bit
        #10;
        if (out !== in[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);
            $finish;
        end

        // Test case 6: Select 5
        sel = 3'b101;    // Select the sixth bit
        #10;
        if (out !== in[5]) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], out);
            $finish;
        end

        // Test case 7: Select 6
        sel = 3'b110;    // Select the seventh bit
        #10;
        if (out !== in[6]) begin
            $display("FAIL: Test case 7 failed, expected %b, got %b", in[6], out);
            $finish;
        end

        // Test case 8: Select 7
        sel = 3'b111;    // Select the eighth bit
        #10;
        if (out !== in[7]) begin
            $display("FAIL: Test case 8 failed, expected %b, got %b", in[7], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule