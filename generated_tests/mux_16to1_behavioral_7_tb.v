`timescale 1ns/1ps

module tb_mux_16to1_behavioral;

    reg [3:0] sel;
    reg [15:0] in;
    wire out;

    // Instantiate the module under test (uut)
    mux_16to1_behavioral uut (
        .sel(sel),
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Select 0, expect out = in[0]
        in = 16'b1010101010101010; // Example input
        sel = 4'b0000; // Select the first bit
        #10;
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", in[0], out);
            $finish;
        end

        // Test case 2: Select 1, expect out = in[1]
        sel = 4'b0001; // Select the second bit
        #10;
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", in[1], out);
            $finish;
        end

        // Test case 3: Select 2, expect out = in[2]
        sel = 4'b0010; // Select the third bit
        #10;
        if (out !== in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", in[2], out);
            $finish;
        end

        // Test case 4: Select 3, expect out = in[3]
        sel = 4'b0011; // Select the fourth bit
        #10;
        if (out !== in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", in[3], out);
            $finish;
        end

        // Test case 5: Select 15, expect out = in[15]
        sel = 4'b1111; // Select the last bit
        #10;
        if (out !== in[15]) begin
            $display("FAIL: Test case 5 failed, expected %b but got %b", in[15], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule