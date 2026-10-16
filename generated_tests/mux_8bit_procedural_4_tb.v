`timescale 1ns/1ps

module tb_mux_8bit_procedural;

    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_8bit_procedural uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select the first bit
        in = 8'b10101010; sel = 3'b000; #10;
        if (out !== in[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);

        // Test case 2: Select the second bit
        in = 8'b10101010; sel = 3'b001; #10;
        if (out !== in[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);

        // Test case 3: Select the third bit
        in = 8'b10101010; sel = 3'b010; #10;
        if (out !== in[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);

        // Test case 4: Select the fourth bit
        in = 8'b10101010; sel = 3'b011; #10;
        if (out !== in[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);

        // Test case 5: Select the fifth bit
        in = 8'b10101010; sel = 3'b100; #10;
        if (out !== in[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);

        // Test case 6: Select the sixth bit
        in = 8'b10101010; sel = 3'b101; #10;
        if (out !== in[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], out);

        // Test case 7: Select the seventh bit
        in = 8'b10101010; sel = 3'b110; #10;
        if (out !== in[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", in[6], out);

        // Test case 8: Select the eighth bit
        in = 8'b10101010; sel = 3'b111; #10;
        if (out !== in[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", in[7], out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule