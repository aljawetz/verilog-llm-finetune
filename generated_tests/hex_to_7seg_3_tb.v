`timescale 1ns/1ps

module tb_hex_to_7seg;

    // Inputs
    reg [3:0] hex;

    // Outputs
    wire a, b, c, d, e, f, g;

    // Instantiate the Unit Under Test (UUT)
    hex_to_7seg uut (
        .hex(hex),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );

    initial begin
        // Test all hexadecimal values from 0 to F
        hex = 4'h0; #10; check_output(7'b0000001);
        hex = 4'h1; #10; check_output(7'b1001111);
        hex = 4'h2; #10; check_output(7'b0010010);
        hex = 4'h3; #10; check_output(7'b0000110);
        hex = 4'h4; #10; check_output(7'b1001100);
        hex = 4'h5; #10; check_output(7'b0100100);
        hex = 4'h6; #10; check_output(7'b0100000);
        hex = 4'h7; #10; check_output(7'b0001111);
        hex = 4'h8; #10; check_output(7'b0000000);
        hex = 4'h9; #10; check_output(7'b0000100);
        hex = 4'hA; #10; check_output(7'b0001000);
        hex = 4'hB; #10; check_output(7'b1100000);
        hex = 4'hC; #10; check_output(7'b0110001);
        hex = 4'hD; #10; check_output(7'b1000010);
        hex = 4'hE; #10; check_output(7'b0110000);
        hex = 4'hF; #10; check_output(7'b0111000);
        
        $display("PASS");
        $finish;
    end

    task check_output(input [6:0] expected);
        if ({a, b, c, d, e, f, g} !== expected) begin
            $display("FAIL: Expected %b but got %b for hex = %h", expected, {a, b, c, d, e, f, g}, hex);
            $finish;
        end
    endtask

endmodule