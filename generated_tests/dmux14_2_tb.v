`timescale 1ns/1ps

module tb_dmux14;

reg i;
reg [1:0] sel;
wire o0, o1, o2, o3;

// Instantiate the module under test (uut)
dmux14 uut (
    .i(i),
    .sel(sel),
    .o0(o0),
    .o1(o1),
    .o2(o2),
    .o3(o3)
);

initial begin
    // Test case 1: Input high, select 00
    i = 1; sel = 2'b00; #10;
    if (o0 !== 1 || o1 !== 0 || o2 !== 0 || o3 !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Input high, select 01
    i = 1; sel = 2'b01; #10;
    if (o0 !== 0 || o1 !== 1 || o2 !== 0 || o3 !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Input high, select 10
    i = 1; sel = 2'b10; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 1 || o3 !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Input high, select 11
    i = 1; sel = 2'b11; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Input low, select 00
    i = 0; sel = 2'b00; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Input low, select 01
    i = 0; sel = 2'b01; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: Input low, select 10
    i = 0; sel = 2'b10; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: Input low, select 11
    i = 0; sel = 2'b11; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule