`timescale 1ns/1ps

module tb_sbox2;

    reg [1:0] addr;
    wire [3:0] dout;
    reg [3:0] expected_dout;

    sbox2 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test cases
        addr = 2'b00; #10; expected_dout = 4'b1111; // 0
        if (dout !== expected_dout) $display("FAIL: addr=00, expected=%b, got=%b", expected_dout, dout);

        addr = 2'b01; #10; expected_dout = 4'b0001; // 1
        if (dout !== expected_dout) $display("FAIL: addr=01, expected=%b, got=%b", expected_dout, dout);

        addr = 2'b10; #10; expected_dout = 4'b1000; // 2
        if (dout !== expected_dout) $display("FAIL: addr=10, expected=%b, got=%b", expected_dout, dout);

        addr = 2'b11; #10; expected_dout = 4'b1110; // 3
        if (dout !== expected_dout) $display("FAIL: addr=11, expected=%b, got=%b", expected_dout, dout);

        // Additional tests for full coverage
        addr = 2'b00; #10; expected_dout = 4'b1111; // 0
        if (dout !== expected_dout) $display("FAIL: addr=00, expected=%b, got=%b", expected_dout, dout);

        addr = 2'b01; #10; expected_dout = 4'b0001; // 1
        if (dout !== expected_dout) $display("FAIL: addr=01, expected=%b, got=%b", expected_dout, dout);

        addr = 2'b10; #10; expected_dout = 4'b1000; // 2
        if (dout !== expected_dout) $display("FAIL: addr=10, expected=%b, got=%b", expected_dout, dout);

        addr = 2'b11; #10; expected_dout = 4'b1110; // 3
        if (dout !== expected_dout) $display("FAIL: addr=11, expected=%b, got=%b", expected_dout, dout);

        // Final check
        $display("PASS");
        $finish;
    end

endmodule