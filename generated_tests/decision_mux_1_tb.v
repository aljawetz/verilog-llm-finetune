`timescale 1ns/1ps

module tb_decision_mux;

parameter WIDTH = 16;
parameter ROUN_WIDTH = 0;
parameter LOG2_WIDTH = 4;

reg [2*WIDTH-1:0] IN;
reg decision_bit;
wire [2*WIDTH+ROUN_WIDTH-1:0] IN_r;

// Instantiate the module under test
decision_mux #(WIDTH, ROUN_WIDTH, LOG2_WIDTH) uut (
    .IN(IN),
    .decision_bit(decision_bit),
    .IN_r(IN_r)
);

initial begin
    // Test case 1: decision_bit is 0, should output IN
    IN = 16'h0001; // 1 in decimal
    decision_bit = 0;
    #10;
    if (IN_r !== IN) begin
        $display("FAIL: Test case 1 failed, expected %h, got %h", IN, IN_r);
        $finish;
    end

    // Test case 2: decision_bit is 1, should output IN shifted left by 1
    IN = 16'h0001; // 1 in decimal
    decision_bit = 1;
    #10;
    if (IN_r !== (IN << 1)) begin
        $display("FAIL: Test case 2 failed, expected %h, got %h", (IN << 1), IN_r);
        $finish;
    end

    // Test case 3: decision_bit is 0, larger number
    IN = 16'h0002; // 2 in decimal
    decision_bit = 0;
    #10;
    if (IN_r !== IN) begin
        $display("FAIL: Test case 3 failed, expected %h, got %h", IN, IN_r);
        $finish;
    end

    // Test case 4: decision_bit is 1, larger number
    IN = 16'h0002; // 2 in decimal
    decision_bit = 1;
    #10;
    if (IN_r !== (IN << 1)) begin
        $display("FAIL: Test case 4 failed, expected %h, got %h", (IN << 1), IN_r);
        $finish;
    end

    // Test case 5: decision_bit is 1, maximum value
    IN = {WIDTH{1'b1}}; // Max value for WIDTH bits
    decision_bit = 1;
    #10;
    if (IN_r !== (IN << 1)) begin
        $display("FAIL: Test case 5 failed, expected %h, got %h", (IN << 1), IN_r);
        $finish;
    end

    // Test case 6: decision_bit is 0, maximum value
    decision_bit = 0;
    #10;
    if (IN_r !== IN) begin
        $display("FAIL: Test case 6 failed, expected %h, got %h", IN, IN_r);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule