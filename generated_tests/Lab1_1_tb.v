`timescale 1ns/1ps

module tb_Lab1;

reg [17:0] SW;
wire [17:0] LEDR;

// Instantiate the module under test
Lab1 uut (
    .SW(SW),
    .LEDR(LEDR)
);

initial begin
    // Test case 1: All switches off
    SW = 18'b000000000000000000;
    #10;
    if (LEDR !== 18'b000000000000000000) begin
        $display("FAIL: Test case 1 failed, expected 0, got %b", LEDR);
        $finish;
    end

    // Test case 2: All switches on
    SW = 18'b111111111111111111;
    #10;
    if (LEDR !== 18'b111111111111111111) begin
        $display("FAIL: Test case 2 failed, expected 1, got %b", LEDR);
        $finish;
    end

    // Test case 3: Alternate switches
    SW = 18'b101010101010101010;
    #10;
    if (LEDR !== 18'b101010101010101010) begin
        $display("FAIL: Test case 3 failed, expected 101010101010101010, got %b", LEDR);
        $finish;
    end

    // Test case 4: All switches off except the first
    SW = 18'b000000000000000001;
    #10;
    if (LEDR !== 18'b000000000000000001) begin
        $display("FAIL: Test case 4 failed, expected 1, got %b", LEDR);
        $finish;
    end

    // Test case 5: All switches off except the last
    SW = 18'b100000000000000000;
    #10;
    if (LEDR !== 18'b100000000000000000) begin
        $display("FAIL: Test case 5 failed, expected 100000000000000000, got %b", LEDR);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule