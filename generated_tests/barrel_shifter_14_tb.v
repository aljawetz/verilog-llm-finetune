`timescale 1ns/1ps

module tb_barrel_shifter;

    reg [7:0] data_in;
    reg [2:0] shift_amount;
    reg direction;
    wire [7:0] data_out;

    // Instantiate the barrel shifter module
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amount(shift_amount),
        .direction(direction),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: No shift
        data_in = 8'b10101010; shift_amount = 3'b000; direction = 0;
        #10;
        if (data_out !== 8'b10101010) $display("FAIL: Test case 1 failed");

        // Test case 2: Shift left by 1
        data_in = 8'b10101010; shift_amount = 3'b001; direction = 0;
        #10;
        if (data_out !== 8'b01010100) $display("FAIL: Test case 2 failed");

        // Test case 3: Shift right by 1
        data_in = 8'b10101010; shift_amount = 3'b001; direction = 1;
        #10;
        if (data_out !== 8'b01010101) $display("FAIL: Test case 3 failed");

        // Test case 4: Shift left by 2
        data_in = 8'b10101010; shift_amount = 3'b010; direction = 0;
        #10;
        if (data_out !== 8'b00101000) $display("FAIL: Test case 4 failed");

        // Test case 5: Shift right by 2
        data_in = 8'b10101010; shift_amount = 3'b010; direction = 1;
        #10;
        if (data_out !== 8'b00101010) $display("FAIL: Test case 5 failed");

        // Test case 6: Shift left by 3
        data_in = 8'b10101010; shift_amount = 3'b011; direction = 0;
        #10;
        if (data_out !== 8'b00010100) $display("FAIL: Test case 6 failed");

        // Test case 7: Shift right by 3
        data_in = 8'b10101010; shift_amount = 3'b011; direction = 1;
        #10;
        if (data_out !== 8'b01010101) $display("FAIL: Test case 7 failed");

        // Test case 8: Shift left by 4
        data_in = 8'b10101010; shift_amount = 3'b100; direction = 0;
        #10;
        if (data_out !== 8'b00001010) $display("FAIL: Test case 8 failed");

        // Test case 9: Shift right by 4
        data_in = 8'b10101010; shift_amount = 3'b100; direction = 1;
        #10;
        if (data_out !== 8'b00001010) $display("FAIL: Test case 9 failed");

        // Test case 10: Shift left by 5
        data_in = 8'b10101010; shift_amount = 3'b101; direction = 0;
        #10;
        if (data_out !== 8'b00000101) $display("FAIL: Test case 10 failed");

        // Test case 11: Shift right by 5
        data_in = 8'b10101010; shift_amount = 3'b101; direction = 1;
        #10;
        if (data_out !== 8'b00001010) $display("FAIL: Test case 11 failed");

        // Test case 12: Shift left by 6
        data_in = 8'b10101010; shift_amount = 3'b110; direction = 0;
        #10;
        if (data_out !== 8'b00000010) $display("FAIL: Test case 12 failed");

        // Test case 13: Shift right by 6
        data_in = 8'b10101010; shift_amount = 3'b110; direction = 1;
        #10;
        if (data_out !== 8'b00001010) $display("FAIL: Test case 13 failed");

        // Test case 14: Shift left by 7
        data_in = 8'b10101010; shift_amount = 3'b111; direction = 0;
        #10;
        if (data_out !== 8'b00000001) $display("FAIL: Test case 14 failed");

        // Test case 15: Shift right by 7
        data_in = 8'b10101010; shift_amount = 3'b111; direction = 1;
        #10;
        if (data_out !== 8'b10101010) $display("FAIL: Test case 15 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule