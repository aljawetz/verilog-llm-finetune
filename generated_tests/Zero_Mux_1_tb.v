`timescale 1ns/1ps

module tb_Zero_Mux;

parameter LOG2_WIDTH = 4;
parameter WIDTH = 2**LOG2_WIDTH;
parameter LOG2_NIBBLE_WIDTH = 2;
parameter NIBBLE_WIDTH = 2**LOG2_NIBBLE_WIDTH;

reg [NIBBLE_WIDTH-1:0] NIBBLE;
reg [2*WIDTH-1:0] IN;
wire [2*WIDTH-1:0] OUT;

Zero_Mux #(LOG2_WIDTH, WIDTH, 0, LOG2_NIBBLE_WIDTH, NIBBLE_WIDTH) uut (
    .NIBBLE(NIBBLE),
    .IN(IN),
    .OUT(OUT)
);

initial begin
    // Test case 1: NIBBLE = 4'b0000, expect OUT = 0
    NIBBLE = 4'b0000;
    IN = 16'hABCD; // arbitrary non-zero input
    #10;
    if (OUT !== 16'd0) begin
        $display("FAIL: Test case 1 failed, expected OUT = 0, got OUT = %d", OUT);
        $finish;
    end

    // Test case 2: NIBBLE = 4'b0001, expect OUT = IN
    NIBBLE = 4'b0001;
    IN = 16'hABCD;
    #10;
    if (OUT !== IN) begin
        $display("FAIL: Test case 2 failed, expected OUT = IN, got OUT = %d", OUT);
        $finish;
    end

    // Test case 3: NIBBLE = 4'b1111, expect OUT = IN
    NIBBLE = 4'b1111;
    IN = 16'h1234;
    #10;
    if (OUT !== IN) begin
        $display("FAIL: Test case 3 failed, expected OUT = IN, got OUT = %d", OUT);
        $finish;
    end

    // Test case 4: NIBBLE = 4'b0010, expect OUT = IN
    NIBBLE = 4'b0010;
    IN = 16'h5678;
    #10;
    if (OUT !== IN) begin
        $display("FAIL: Test case 4 failed, expected OUT = IN, got OUT = %d", OUT);
        $finish;
    end

    // Test case 5: NIBBLE = 4'b0000, expect OUT = 0 again
    NIBBLE = 4'b0000;
    IN = 16'hFFFF; // another arbitrary non-zero input
    #10;
    if (OUT !== 16'd0) begin
        $display("FAIL: Test case 5 failed, expected OUT = 0, got OUT = %d", OUT);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule