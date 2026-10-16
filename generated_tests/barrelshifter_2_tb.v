`timescale 1ns/1ps

module tb_barrelshifter;

    reg [7:0] datain;
    reg [2:0] shiftamt;
    reg [2:0] shifttype;
    wire [7:0] dataout;

    // Instantiate the barrelshifter module
    barrelshifter uut (
        .datain(datain),
        .shiftamt(shiftamt),
        .shifttype(shifttype),
        .dataout(dataout)
    );

    initial begin
        // Test logical left shift
        datain = 8'b00001111; shiftamt = 3'b000; shifttype = 3'b000; #10;
        if (dataout !== 8'b00111100) $display("FAIL: Logical left shift failed");

        // Test logical right shift
        datain = 8'b00001111; shiftamt = 3'b001; shifttype = 3'b001; #10;
        if (dataout !== 8'b00000111) $display("FAIL: Logical right shift failed");

        // Test arithmetic right shift
        datain = 8'b11110000; shiftamt = 3'b001; shifttype = 3'b010; #10;
        if (dataout !== 8'b11111000) $display("FAIL: Arithmetic right shift failed");

        // Test rotate right
        datain = 8'b00001111; shiftamt = 3'b001; shifttype = 3'b011; #10;
        if (dataout !== 8'b10000111) $display("FAIL: Rotate right failed");

        // Test rotate left
        datain = 8'b00001111; shiftamt = 3'b001; shifttype = 3'b100; #10;
        if (dataout !== 8'b00011110) $display("FAIL: Rotate left failed");

        // Test default case
        datain = 8'b10101010; shiftamt = 3'b000; shifttype = 3'b111; #10;
        if (dataout !== 8'b10101010) $display("FAIL: Default case failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule