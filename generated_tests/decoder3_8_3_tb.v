`timescale 1ns/1ps

module tb_decoder3_8;

    reg [2:0] i;
    wire [7:0] y;
    
    // Instantiate the module under test (uut)
    decoder3_8 uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: Check output for input 3'b000
        i = 3'b000; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Expected 8'b00000001 for input 3'b000, got %b", y);
            $finish;
        end

        // Test case 2: Check output for input 3'b001
        i = 3'b001; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Expected 8'b00000010 for input 3'b001, got %b", y);
            $finish;
        end

        // Test case 3: Check output for input 3'b010
        i = 3'b010; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Expected 8'b00000100 for input 3'b010, got %b", y);
            $finish;
        end

        // Test case 4: Check output for input 3'b011
        i = 3'b011; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Expected 8'b00001000 for input 3'b011, got %b", y);
            $finish;
        end

        // Test case 5: Check output for input 3'b100
        i = 3'b100; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Expected 8'b00010000 for input 3'b100, got %b", y);
            $finish;
        end

        // Test case 6: Check output for input 3'b101
        i = 3'b101; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Expected 8'b00100000 for input 3'b101, got %b", y);
            $finish;
        end

        // Test case 7: Check output for input 3'b110
        i = 3'b110; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Expected 8'b01000000 for input 3'b110, got %b", y);
            $finish;
        end

        // Test case 8: Check output for input 3'b111
        i = 3'b111; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Expected 8'b10000000 for input 3'b111, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule