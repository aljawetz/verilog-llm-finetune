`timescale 1ns/1ps

module tb_decoder3_8_df;

    reg [2:0] d;
    wire [7:0] y;

    // Instantiate the Unit Under Test (UUT)
    decoder3_8_df uut (
        .d(d),
        .y(y)
    );

    initial begin
        // Test all possible input combinations
        d = 3'b000; #10;
        if (y !== 8'b00000001) $display("FAIL: Test case d=000 failed, y=%b", y);
        
        d = 3'b001; #10;
        if (y !== 8'b00000010) $display("FAIL: Test case d=001 failed, y=%b", y);
        
        d = 3'b010; #10;
        if (y !== 8'b00000100) $display("FAIL: Test case d=010 failed, y=%b", y);
        
        d = 3'b011; #10;
        if (y !== 8'b00000110) $display("FAIL: Test case d=011 failed, y=%b", y);
        
        d = 3'b100; #10;
        if (y !== 8'b00010000) $display("FAIL: Test case d=100 failed, y=%b", y);
        
        d = 3'b101; #10;
        if (y !== 8'b00010010) $display("FAIL: Test case d=101 failed, y=%b", y);
        
        d = 3'b110; #10;
        if (y !== 8'b01000000) $display("FAIL: Test case d=110 failed, y=%b", y);
        
        d = 3'b111; #10;
        if (y !== 8'b10000000) $display("FAIL: Test case d=111 failed, y=%b", y);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule