`timescale 1ns/1ps

module tb_Decoder_3x8_bh;

    reg [2:0] i;
    wire [7:0] y;
    
    // Instantiate the module under test (uut)
    Decoder_3x8_bh uut (
        .y(y),
        .i(i)
    );

    initial begin
        // Test all possible inputs
        i = 3'b000; #10;
        if (y !== 8'b0000_0001) begin
            $display("FAIL: Test case i=000 failed, expected 0000_0001, got %b", y);
            $finish;
        end
        
        i = 3'b001; #10;
        if (y !== 8'b0000_0010) begin
            $display("FAIL: Test case i=001 failed, expected 0000_0010, got %b", y);
            $finish;
        end
        
        i = 3'b010; #10;
        if (y !== 8'b0000_0100) begin
            $display("FAIL: Test case i=010 failed, expected 0000_0100, got %b", y);
            $finish;
        end
        
        i = 3'b011; #10;
        if (y !== 8'b0000_1000) begin
            $display("FAIL: Test case i=011 failed, expected 0000_1000, got %b", y);
            $finish;
        end
        
        i = 3'b100; #10;
        if (y !== 8'b0001_0000) begin
            $display("FAIL: Test case i=100 failed, expected 0001_0000, got %b", y);
            $finish;
        end
        
        i = 3'b101; #10;
        if (y !== 8'b0010_0000) begin
            $display("FAIL: Test case i=101 failed, expected 0010_0000, got %b", y);
            $finish;
        end
        
        i = 3'b110; #10;
        if (y !== 8'b0100_0000) begin
            $display("FAIL: Test case i=110 failed, expected 0100_0000, got %b", y);
            $finish;
        end
        
        i = 3'b111; #10;
        if (y !== 8'b1000_0000) begin
            $display("FAIL: Test case i=111 failed, expected 1000_0000, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule