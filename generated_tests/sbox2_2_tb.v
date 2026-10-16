`timescale 1ns/1ps

module tb_sbox2;

    reg [1:0] addr;
    wire [1:0] dout;

    // Instantiate the module under test
    sbox2 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test cases
        addr = 2'b00; #10; 
        if (dout !== 2'b11) $display("FAIL: addr=00, expected dout=11, got dout=%b", dout);

        addr = 2'b01; #10; 
        if (dout !== 2'b01) $display("FAIL: addr=01, expected dout=01, got dout=%b", dout);

        addr = 2'b10; #10; 
        if (dout !== 2'b10) $display("FAIL: addr=10, expected dout=10, got dout=%b", dout);

        addr = 2'b11; #10; 
        if (dout !== 2'b00) $display("FAIL: addr=11, expected dout=00, got dout=%b", dout);

        addr = 2'b10; #10; 
        if (dout !== 2'b10) $display("FAIL: addr=10, expected dout=10, got dout=%b", dout);

        addr = 2'b11; #10; 
        if (dout !== 2'b00) $display("FAIL: addr=11, expected dout=00, got dout=%b", dout);

        addr = 2'b00; #10; 
        if (dout !== 2'b11) $display("FAIL: addr=00, expected dout=11, got dout=%b", dout);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule