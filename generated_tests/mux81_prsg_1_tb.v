`timescale 1ns/1ps

module tb_mux81_prsg;

reg [7:0] din;
reg [2:0] sel;
wire dout;

// Instantiate the module under test (uut)
mux81_prsg uut (
    .din(din),
    .sel(sel),
    .dout(dout)
);

initial begin
    // Test sequence
    din = 8'b10101010; // Set input data
    sel = 3'b000; #10; // Select din[0]
    if (dout !== din[0]) $display("FAIL: dout should be %b but got %b", din[0], dout);

    sel = 3'b001; #10; // Select din[1]
    if (dout !== din[1]) $display("FAIL: dout should be %b but got %b", din[1], dout);

    sel = 3'b010; #10; // Select din[2]
    if (dout !== din[2]) $display("FAIL: dout should be %b but got %b", din[2], dout);

    sel = 3'b011; #10; // Select din[3]
    if (dout !== din[3]) $display("FAIL: dout should be %b but got %b", din[3], dout);

    sel = 3'b100; #10; // Select din[4]
    if (dout !== din[4]) $display("FAIL: dout should be %b but got %b", din[4], dout);

    sel = 3'b101; #10; // Select din[5]
    if (dout !== din[5]) $display("FAIL: dout should be %b but got %b", din[5], dout);

    sel = 3'b110; #10; // Select din[6]
    if (dout !== din[6]) $display("FAIL: dout should be %b but got %b", din[6], dout);

    sel = 3'b111; #10; // Select din[7]
    if (dout !== din[7]) $display("FAIL: dout should be %b but got %b", din[7], dout);

    $display("PASS");
    $finish;
end

endmodule