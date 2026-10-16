`timescale 1ns/1ps

module tb_pre_comp_bank;

parameter LOG2_WIDTH = 4;
parameter WIDTH = 2**LOG2_WIDTH;

reg [WIDTH-1:0] I;
wire [WIDTH+2:0] I1, I3, I5, I7;

// Instantiate the module under test (uut)
pre_comp_bank #(LOG2_WIDTH) uut (
    .I(I),
    .I1(I1),
    .I3(I3),
    .I5(I5),
    .I7(I7)
);

initial begin
    // Test case 1: I = 0
    I = 0;
    #10;
    if (I1 !== 0 || I3 !== 0 || I5 !== 0 || I7 !== 0) begin
        $display("FAIL: Test case 1 failed for I = 0");
        $finish;
    end

    // Test case 2: I = 1
    I = 1;
    #10;
    if (I1 !== 1 || I3 !== 3 || I5 !== 5 || I7 !== 7) begin
        $display("FAIL: Test case 2 failed for I = 1");
        $finish;
    end

    // Test case 3: I = 2
    I = 2;
    #10;
    if (I1 !== 2 || I3 !== 6 || I5 !== 10 || I7 !== 14) begin
        $display("FAIL: Test case 3 failed for I = 2");
        $finish;
    end

    // Test case 4: I = 3
    I = 3;
    #10;
    if (I1 !== 3 || I3 !== 9 || I5 !== 15 || I7 !== 21) begin
        $display("FAIL: Test case 4 failed for I = 3");
        $finish;
    end

    // Test case 5: I = 4
    I = 4;
    #10;
    if (I1 !== 4 || I3 !== 12 || I5 !== 20 || I7 !== 28) begin
        $display("FAIL: Test case 5 failed for I = 4");
        $finish;
    end

    // Test case 6: I = 15 (maximum for WIDTH=4)
    I = 15;
    #10;
    if (I1 !== 15 || I3 !== 45 || I5 !== 75 || I7 !== 105) begin
        $display("FAIL: Test case 6 failed for I = 15");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule