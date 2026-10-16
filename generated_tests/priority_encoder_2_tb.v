`timescale 1ns/1ps

module tb_priority_encoder;

    reg [2:0] i;
    wire [1:0] y;
    
    // Instantiate the priority_encoder module
    priority_encoder uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: Only the highest bit is active
        i = 3'b100; // Input: 4 (binary 100)
        #10;
        if (y !== 2'b10) $display("FAIL: Test case 1 failed, expected 2'b10, got %b", y);
        
        // Test case 2: Middle bit is active
        i = 3'b010; // Input: 2 (binary 010)
        #10;
        if (y !== 2'b01) $display("FAIL: Test case 2 failed, expected 2'b01, got %b", y);
        
        // Test case 3: Lowest bit is active
        i = 3'b001; // Input: 1 (binary 001)
        #10;
        if (y !== 2'b00) $display("FAIL: Test case 3 failed, expected 2'b00, got %b", y);
        
        // Test case 4: No bits are active
        i = 3'b000; // Input: 0 (binary 000)
        #10;
        if (y !== 2'b11) $display("FAIL: Test case 4 failed, expected 2'b11, got %b", y);
        
        // Test case 5: Multiple bits are active (highest priority should be taken)
        i = 3'b110; // Input: 6 (binary 110)
        #10;
        if (y !== 2'b10) $display("FAIL: Test case 5 failed, expected 2'b10, got %b", y);
        
        // Test case 6: Another multiple bits active
        i = 3'b011; // Input: 3 (binary 011)
        #10;
        if (y !== 2'b01) $display("FAIL: Test case 6 failed, expected 2'b01, got %b", y);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule