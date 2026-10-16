`timescale 1ns/1ps

module tb_sbox3;

reg [4:0] in;
wire [1:0] out;
reg [1:0] expected_out;

sbox3 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test all possible 5-bit inputs
    in = 5'h00; #10; expected_out = 2'h2; check_output();
    in = 5'h01; #10; expected_out = 2'h0; check_output();
    in = 5'h02; #10; expected_out = 2'h1; check_output();
    in = 5'h03; #10; expected_out = 2'h2; check_output();
    in = 5'h04; #10; expected_out = 2'h2; check_output();
    in = 5'h05; #10; expected_out = 2'h3; check_output();
    in = 5'h06; #10; expected_out = 2'h3; check_output();
    in = 5'h07; #10; expected_out = 2'h1; check_output();
    in = 5'h08; #10; expected_out = 2'h1; check_output();
    in = 5'h09; #10; expected_out = 2'h1; check_output();
    in = 5'h0a; #10; expected_out = 2'h0; check_output();
    in = 5'h0b; #10; expected_out = 2'h3; check_output();
    in = 5'h0c; #10; expected_out = 2'h3; check_output();
    in = 5'h0d; #10; expected_out = 2'h0; check_output();
    in = 5'h0e; #10; expected_out = 2'h2; check_output();
    in = 5'h0f; #10; expected_out = 2'h0; check_output();
    in = 5'h10; #10; expected_out = 2'h1; check_output();
    in = 5'h11; #10; expected_out = 2'h3; check_output();
    in = 5'h12; #10; expected_out = 2'h0; check_output();
    in = 5'h13; #10; expected_out = 2'h1; check_output();
    in = 5'h14; #10; expected_out = 2'h3; check_output();
    in = 5'h15; #10; expected_out = 2'h0; check_output();
    in = 5'h16; #10; expected_out = 2'h2; check_output();
    in = 5'h17; #10; expected_out = 2'h2; check_output();
    in = 5'h18; #10; expected_out = 2'h2; check_output();
    in = 5'h19; #10; expected_out = 2'h0; check_output();
    in = 5'h1a; #10; expected_out = 2'h1; check_output();
    in = 5'h1b; #10; expected_out = 2'h2; check_output();
    in = 5'h1c; #10; expected_out = 2'h0; check_output();
    in = 5'h1d; #10; expected_out = 2'h3; check_output();
    in = 5'h1e; #10; expected_out = 2'h3; check_output();
    in = 5'h1f; #10; expected_out = 2'h1; check_output();

    $display("PASS");
    $finish;
end

task check_output;
    if (out !== expected_out) begin
        $display("FAIL: Expected %b but got %b for input %b", expected_out, out, in);
        $finish;
    end
endtask

endmodule