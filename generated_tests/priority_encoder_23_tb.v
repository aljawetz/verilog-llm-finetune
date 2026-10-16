`timescale 1ns/1ps

module tb_priority_encoder;

    reg [2:0] i;
    wire [1:0] y;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: i = 3'b100
        i = 3'b100; #10;
        if (y !== 2'b10) $display("FAIL: Test case 1 failed, expected 2'b10, got %b", y);

        // Test case 2: i = 3'b010
        i = 3'b010; #10;
        if (y !== 2'b01) $display("FAIL: Test case 2 failed, expected 2'b01, got %b", y);

        // Test case 3: i = 3'b001
        i = 3'b001; #10;
        if (y !== 2'b00) $display("FAIL: Test case 3 failed, expected 2'b00, got %b", y);

        // Test case 4: i = 3'b000
        i = 3'b000; #10;
        if (y !== 2'b11) $display("FAIL: Test case 4 failed, expected 2'b11, got %b", y);

        // Test case 5: i = 3'b111 (multiple high bits)
        i = 3'b111; #10;
        if (y !== 2'b11) $display("FAIL: Test case 5 failed, expected 2'b11, got %b", y);

        // Test case 6: i = 3'b110 (multiple high bits)
        i = 3'b110; #10;
        if (y !== 2'b11) $display("FAIL: Test case 6 failed, expected 2'b11, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule