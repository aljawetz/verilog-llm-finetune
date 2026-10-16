`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] in;
    reg en;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .in(in),
        .en(en),
        .y(y)
    );

    initial begin
        // Test case 1: Enable with only the least significant bit active
        en = 1;
        in = 8'b0000_0001; #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);

        // Test case 2: Enable with the second least significant bit active
        in = 8'b0000_0010; #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 3'b001, got %b", y);

        // Test case 3: Enable with the third least significant bit active
        in = 8'b0000_0100; #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 3'b010, got %b", y);

        // Test case 4: Enable with the fourth least significant bit active
        in = 8'b0000_1000; #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 3'b011, got %b", y);

        // Test case 5: Enable with the fifth least significant bit active
        in = 8'b0001_0000; #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 3'b100, got %b", y);

        // Test case 6: Enable with the sixth least significant bit active
        in = 8'b0010_0000; #10;
        if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 3'b101, got %b", y);

        // Test case 7: Enable with the seventh least significant bit active
        in = 8'b0100_0000; #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 3'b110, got %b", y);

        // Test case 8: Enable with the most significant bit active
        in = 8'b1000_0000; #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 3'b111, got %b", y);

        // Test case 9: Disable the encoder
        en = 0; in = 8'b1111_1111; #10;
        if (y !== 3'bxxx) $display("FAIL: Test case 9 failed, expected 3'bxxx, got %b", y);

        // Test case 10: Enable with multiple bits active
        en = 1; in = 8'b0110_0000; #10;
        if (y !== 3'b110) $display("FAIL: Test case 10 failed, expected 3'b110, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule