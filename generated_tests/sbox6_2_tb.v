`timescale 1ns/1ps

module tb_sbox6;

    reg [1:0] addr;
    wire [1:0] dout;

    // Instantiate the module under test
    sbox6 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test vector initialization
        addr = 2'b00; #10;
        if (dout !== 2'b00) $display("FAIL: Expected dout=00 for addr=00, got dout=%b", dout);

        addr = 2'b01; #10;
        if (dout !== 2'b01) $display("FAIL: Expected dout=01 for addr=01, got dout=%b", dout);

        addr = 2'b10; #10;
        if (dout !== 2'b10) $display("FAIL: Expected dout=10 for addr=10, got dout=%b", dout);

        addr = 2'b11; #10;
        if (dout !== 2'b11) $display("FAIL: Expected dout=11 for addr=11, got dout=%b", dout);

        addr = 2'b00; #10; // Repeat for more values
        addr = 2'b01; #10;
        addr = 2'b10; #10;
        addr = 2'b11; #10;

        // Additional test cases
        addr = 2'b10; #10; // Test for addr=10
        if (dout !== 2'b10) $display("FAIL: Expected dout=10 for addr=10, got dout=%b", dout);

        addr = 2'b11; #10; // Test for addr=11
        if (dout !== 2'b11) $display("FAIL: Expected dout=11 for addr=11, got dout=%b", dout);

        // Final check
        addr = 2'b00; #10;
        if (dout !== 2'b00) $display("FAIL: Expected dout=00 for addr=00, got dout=%b", dout);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule