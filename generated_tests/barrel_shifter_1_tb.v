`timescale 1ns/1ps

module tb_barrel_shifter;

    reg [7:0] data_in;
    reg [2:0] shift_amount;
    reg [1:0] shift_type;
    wire [7:0] data_out;

    // Instantiate the barrel shifter module
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amount(shift_amount),
        .shift_type(shift_type),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: Logical Left Shift
        data_in = 8'b00001111; shift_amount = 3'b000; shift_type = 2'b00; #10;
        if (data_out !== 8'b00001111) $display("FAIL: Logical Left Shift by 0 failed");

        shift_amount = 3'b001; #10;
        if (data_out !== 8'b00011110) $display("FAIL: Logical Left Shift by 1 failed");

        shift_amount = 3'b010; #10;
        if (data_out !== 8'b00111100) $display("FAIL: Logical Left Shift by 2 failed");

        shift_amount = 3'b011; #10;
        if (data_out !== 8'b01111000) $display("FAIL: Logical Left Shift by 3 failed");

        shift_amount = 3'b100; #10;
        if (data_out !== 8'b11110000) $display("FAIL: Logical Left Shift by 4 failed");

        shift_amount = 3'b101; #10;
        if (data_out !== 8'b11100000) $display("FAIL: Logical Left Shift by 5 failed");

        shift_amount = 3'b110; #10;
        if (data_out !== 8'b11000000) $display("FAIL: Logical Left Shift by 6 failed");

        shift_amount = 3'b111; #10;
        if (data_out !== 8'b10000000) $display("FAIL: Logical Left Shift by 7 failed");

        // Test case 2: Logical Right Shift
        data_in = 8'b00001111; shift_amount = 3'b000; shift_type = 2'b01; #10;
        if (data_out !== 8'b00001111) $display("FAIL: Logical Right Shift by 0 failed");

        shift_amount = 3'b001; #10;
        if (data_out !== 8'b00000111) $display("FAIL: Logical Right Shift by 1 failed");

        shift_amount = 3'b010; #10;
        if (data_out !== 8'b00000011) $display("FAIL: Logical Right Shift by 2 failed");

        shift_amount = 3'b011; #10;
        if (data_out !== 8'b00000001) $display("FAIL: Logical Right Shift by 3 failed");

        shift_amount = 3'b100; #10;
        if (data_out !== 8'b00000000) $display("FAIL: Logical Right Shift by 4 failed");

        shift_amount = 3'b101; #10;
        if (data_out !== 8'b00000000) $display("FAIL: Logical Right Shift by 5 failed");

        shift_amount = 3'b110; #10;
        if (data_out !== 8'b00000000) $display("FAIL: Logical Right Shift by 6 failed");

        shift_amount = 3'b111; #10;
        if (data_out !== 8'b00000000) $display("FAIL: Logical Right Shift by 7 failed");

        // Test case 3: Circular Left Shift
        data_in = 8'b00001111; shift_amount = 3'b000; shift_type = 2'b10; #10;
        if (data_out !== 8'b00001111) $display("FAIL: Circular Left Shift by 0 failed");

        shift_amount = 3'b001; #10;
        if (data_out !== 8'b00011111) $display("FAIL: Circular Left Shift by 1 failed");

        shift_amount = 3'b010; #10;
        if (data_out !== 8'b00111100) $display("FAIL: Circular Left Shift by 2 failed");

        shift_amount = 3'b011; #10;
        if (data_out !== 8'b01111000) $display("FAIL: Circular Left Shift by 3 failed");

        shift_amount = 3'b100; #10;
        if (data_out !== 8'b11110000) $display("FAIL: Circular Left Shift by 4 failed");

        shift_amount = 3'b101; #10;
        if (data_out !== 8'b11100001) $display("FAIL: Circular Left Shift by 5 failed");

        shift_amount = 3'b110; #10;
        if (data_out !== 8'b11000011) $display("FAIL: Circular Left Shift by 6 failed");

        shift_amount = 3'b111; #10;
        if (data_out !== 8'b10000111) $display("FAIL: Circular Left Shift by 7 failed");

        // Test case 4: Circular Right Shift
        data_in = 8'b00001111; shift_amount = 3'b000; shift_type = 2'b11; #10;
        if (data_out !== 8'b00001111) $display("FAIL: Circular Right Shift by 0 failed");

        shift_amount = 3'b001; #10;
        if (data_out !== 8'b10000111) $display("FAIL: Circular Right Shift by 1 failed");

        shift_amount = 3'b010; #10;
        if (data_out !== 8'b11000011) $display("FAIL: Circular Right Shift by 2 failed");

        shift_amount = 3'b011; #10;
        if (data_out !== 8'b11110000) $display("FAIL: Circular Right Shift by 3 failed");

        shift_amount = 3'b100; #10;
        if (data_out !== 8'b01111000) $display("FAIL: Circular Right Shift by 4 failed");

        shift_amount = 3'b101; #10;
        if (data_out !== 8'b00111100) $display("FAIL: Circular Right Shift by 5 failed");

        shift_amount = 3'b110; #10;
        if (data_out !== 8'b00011110) $display("FAIL: Circular Right Shift by 6 failed");

        shift_amount = 3'b111; #10;
        if (data_out !== 8'b00001111) $display("FAIL: Circular Right Shift by 7 failed");

        $display("PASS");
        $finish;
    end

endmodule