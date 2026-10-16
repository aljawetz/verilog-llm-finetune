`timescale 1ns/1ps

module tb_mux_4_1_behavioral;

reg [3:0] i;
reg [1:0] sel;
wire y;

// Instantiate the module under test
mux_4_1_behavioral uut (
    .i(i),
    .sel(sel),
    .y(y)
);

initial begin
    // Test case 1: Select 0, expect output to be i[0]
    i = 4'b1010; // i = 10
    sel = 2'b00; // Select first input
    #10;
    if (y !== i[0]) begin
        $display("FAIL: Test case 1 failed, expected %b, got %b", i[0], y);
        $finish;
    end

    // Test case 2: Select 1, expect output to be i[1]
    sel = 2'b01; // Select second input
    #10;
    if (y !== i[1]) begin
        $display("FAIL: Test case 2 failed, expected %b, got %b", i[1], y);
        $finish;
    end

    // Test case 3: Select 2, expect output to be i[2]
    sel = 2'b10; // Select third input
    #10;
    if (y !== i[2]) begin
        $display("FAIL: Test case 3 failed, expected %b, got %b", i[2], y);
        $finish;
    end

    // Test case 4: Select 3, expect output to be i[3]
    sel = 2'b11; // Select fourth input
    #10;
    if (y !== i[3]) begin
        $display("FAIL: Test case 4 failed, expected %b, got %b", i[3], y);
        $finish;
    end

    // Test case 5: Check default case (not applicable here since sel is always valid)
    sel = 2'bxx; // Invalid select
    #10;
    if (y !== 1'b0) begin
        $display("FAIL: Test case 5 failed, expected 0, got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule