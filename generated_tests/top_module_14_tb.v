`timescale 1ns/1ps

module tb_top_module;

    reg [3:0] in;
    wire [1:0] pos;

    // Instantiate the module under test
    top_module uut (
        .in(in),
        .pos(pos)
    );

    initial begin
        // Test cases
        in = 4'h0; #10; if (pos !== 2'b00) $display("FAIL: Input 0 produced incorrect output %b", pos);
        in = 4'h1; #10; if (pos !== 2'b00) $display("FAIL: Input 1 produced incorrect output %b", pos);
        in = 4'h2; #10; if (pos !== 2'b01) $display("FAIL: Input 2 produced incorrect output %b", pos);
        in = 4'h3; #10; if (pos !== 2'b00) $display("FAIL: Input 3 produced incorrect output %b", pos);
        in = 4'h4; #10; if (pos !== 2'b10) $display("FAIL: Input 4 produced incorrect output %b", pos);
        in = 4'h5; #10; if (pos !== 2'b00) $display("FAIL: Input 5 produced incorrect output %b", pos);
        in = 4'h6; #10; if (pos !== 2'b01) $display("FAIL: Input 6 produced incorrect output %b", pos);
        in = 4'h7; #10; if (pos !== 2'b00) $display("FAIL: Input 7 produced incorrect output %b", pos);
        in = 4'h8; #10; if (pos !== 2'b11) $display("FAIL: Input 8 produced incorrect output %b", pos);
        in = 4'h9; #10; if (pos !== 2'b00) $display("FAIL: Input 9 produced incorrect output %b", pos);
        in = 4'hA; #10; if (pos !== 2'b01) $display("FAIL: Input A produced incorrect output %b", pos);
        in = 4'hB; #10; if (pos !== 2'b00) $display("FAIL: Input B produced incorrect output %b", pos);
        in = 4'hC; #10; if (pos !== 2'b10) $display("FAIL: Input C produced incorrect output %b", pos);
        in = 4'hD; #10; if (pos !== 2'b00) $display("FAIL: Input D produced incorrect output %b", pos);
        in = 4'hE; #10; if (pos !== 2'b01) $display("FAIL: Input E produced incorrect output %b", pos);
        in = 4'hF; #10; if (pos !== 2'b00) $display("FAIL: Input F produced incorrect output %b", pos);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule