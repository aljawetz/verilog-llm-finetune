`timescale 1ns/1ps

module tb_demux_1to8;

    reg a;
    reg [2:0] s;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    demux_1to8 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select line 0
        a = 1'b1; s = 3'b000; #10;
        if (y !== 8'b00000001) $display("FAIL: Test case 1 failed");
        
        // Test case 2: Select line 1
        a = 1'b1; s = 3'b001; #10;
        if (y !== 8'b00000010) $display("FAIL: Test case 2 failed");
        
        // Test case 3: Select line 2
        a = 1'b1; s = 3'b010; #10;
        if (y !== 8'b00000100) $display("FAIL: Test case 3 failed");
        
        // Test case 4: Select line 3
        a = 1'b1; s = 3'b011; #10;
        if (y !== 8'b00001000) $display("FAIL: Test case 4 failed");
        
        // Test case 5: Select line 4
        a = 1'b1; s = 3'b100; #10;
        if (y !== 8'b00010000) $display("FAIL: Test case 5 failed");
        
        // Test case 6: Select line 5
        a = 1'b1; s = 3'b101; #10;
        if (y !== 8'b00100000) $display("FAIL: Test case 6 failed");
        
        // Test case 7: Select line 6
        a = 1'b1; s = 3'b110; #10;
        if (y !== 8'b01000000) $display("FAIL: Test case 7 failed");
        
        // Test case 8: Select line 7
        a = 1'b1; s = 3'b111; #10;
        if (y !== 8'b10000000) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule