`timescale 1ns/1ps

module tb_count_1s;
    reg [7:0] d_in;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    count_1s uut (
        .d_in(d_in),
        .count(count)
    );

    initial begin
        // Test case 1: All bits are low
        d_in = 8'b00000000; 
        #10;
        if (count !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected count = 0, got count = %b", count);
            $finish;
        end

        // Test case 2: One bit is high
        d_in = 8'b00000001; 
        #10;
        if (count !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected count = 1, got count = %b", count);
            $finish;
        end

        // Test case 3: Four bits are high
        d_in = 8'b11110000; 
        #10;
        if (count !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected count = 4, got count = %b", count);
            $finish;
        end

        // Test case 4: All bits are high
        d_in = 8'b11111111; 
        #10;
        if (count !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected count = 8, got count = %b", count);
            $finish;
        end

        // Test case 5: Random bits
        d_in = 8'b10101010; 
        #10;
        if (count !== 4'b0100) begin
            $display("FAIL: Test case 5 failed, expected count = 4, got count = %b", count);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule