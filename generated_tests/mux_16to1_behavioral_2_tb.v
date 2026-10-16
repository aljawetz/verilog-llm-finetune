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
        // Test case 1: Select the first bit (sel = 0)
        in = 16'b1010101010101010; // Input vector
        sel = 4'b0000; // Select the first bit
        #10;
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);
            $finish;
        end

        // Test case 2: Select the second bit (sel = 1)
        sel = 4'b0001; // Select the second bit
        #10;
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);
            $finish;
        end

        // Test case 3: Select the last bit (sel = 15)
        sel = 4'b1111; // Select the last bit
        #10;
        if (out !== in[15]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", in[15], out);
            $finish;
        end

        // Test case 4: Select the middle bit (sel = 7)
        sel = 4'b0111; // Select the middle bit
        #10;
        if (out !== in[7]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", in[7], out);
            $finish;
        end

        // Test case 5: Select another random bit (sel = 4)
        sel = 4'b0100; // Select the fifth bit
        #10;
        if (out !== in[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule