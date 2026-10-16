`timescale 1ns/1ps

module tb_barrel_shifter;

    reg [7:0] data_in;
    reg [2:0] shift_amt; // 3 bits for shift amount (0 to 7)
    reg shift_dir;       // 0 for left, 1 for right
    reg rotate;          // 0 for shift, 1 for rotate
    wire [7:0] data_out;

    // Instantiate the barrel shifter
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .shift_dir(shift_dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: Left shift without rotation
        data_in = 8'b00001111; shift_amt = 3'b000; shift_dir = 0; rotate = 0;
        #10;
        if (data_out !== 8'b00001111) $display("FAIL: Test case 1 failed");

        // Test case 2: Left shift by 1
        data_in = 8'b00001111; shift_amt = 3'b001; shift_dir = 0; rotate = 0;
        #10;
        if (data_out !== 8'b00011110) $display("FAIL: Test case 2 failed");

        // Test case 3: Left shift by 2
        data_in = 8'b00001111; shift_amt = 3'b010; shift_dir = 0; rotate = 0;
        #10;
        if (data_out !== 8'b00111100) $display("FAIL: Test case 3 failed");

        // Test case 4: Right shift without rotation
        data_in = 8'b00001111; shift_amt = 3'b000; shift_dir = 1; rotate = 0;
        #10;
        if (data_out !== 8'b00001111) $display("FAIL: Test case 4 failed");

        // Test case 5: Right shift by 1
        data_in = 8'b00001111; shift_amt = 3'b001; shift_dir = 1; rotate = 0;
        #10;
        if (data_out !== 8'b00000111) $display("FAIL: Test case 5 failed");

        // Test case 6: Right shift by 2
        data_in = 8'b00001111; shift_amt = 3'b010; shift_dir = 1; rotate = 0;
        #10;
        if (data_out !== 8'b00000011) $display("FAIL: Test case 6 failed");

        // Test case 7: Left rotate by 1
        data_in = 8'b00001111; shift_amt = 3'b001; shift_dir = 0; rotate = 1;
        #10;
        if (data_out !== 8'b00011110) $display("FAIL: Test case 7 failed");

        // Test case 8: Right rotate by 1
        data_in = 8'b00001111; shift_amt = 3'b001; shift_dir = 1; rotate = 1;
        #10;
        if (data_out !== 8'b10000111) $display("FAIL: Test case 8 failed");

        // Test case 9: Left rotate by 2
        data_in = 8'b00001111; shift_amt = 3'b010; shift_dir = 0; rotate = 1;
        #10;
        if (data_out !== 8'b00111100) $display("FAIL: Test case 9 failed");

        // Test case 10: Right rotate by 2
        data_in = 8'b00001111; shift_amt = 3'b010; shift_dir = 1; rotate = 1;
        #10;
        if (data_out !== 8'b11000011) $display("FAIL: Test case 10 failed");

        $display("PASS");
        $finish;
    end

endmodule