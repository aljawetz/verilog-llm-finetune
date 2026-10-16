`timescale 1ns/1ps

module tb_sbox1;

    reg [1:0] addr;
    wire [1:0] dout;
    
    // Instantiate the module under test
    sbox1 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test cases
        addr = 2'b00; #10;
        if (dout !== 4) $display("FAIL: addr=00, expected dout=4, got dout=%d", dout);
        
        addr = 2'b01; #10;
        if (dout !== 1) $display("FAIL: addr=01, expected dout=1, got dout=%d", dout);
        
        addr = 2'b10; #10;
        if (dout !== 2) $display("FAIL: addr=10, expected dout=2, got dout=%d", dout);
        
        addr = 2'b11; #10;
        if (dout !== 3) $display("FAIL: addr=11, expected dout=3, got dout=%d", dout);
        
        addr = 2'b00; #10;
        if (dout !== 4) $display("FAIL: addr=00, expected dout=4, got dout=%d", dout);
        
        addr = 2'b01; #10;
        if (dout !== 1) $display("FAIL: addr=01, expected dout=1, got dout=%d", dout);
        
        addr = 2'b10; #10;
        if (dout !== 2) $display("FAIL: addr=10, expected dout=2, got dout=%d", dout);
        
        addr = 2'b11; #10;
        if (dout !== 3) $display("FAIL: addr=11, expected dout=3, got dout=%d", dout);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule