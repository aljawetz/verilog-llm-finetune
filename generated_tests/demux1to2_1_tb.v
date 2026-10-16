`timescale 1ns/1ps

module tb_demux1to2;

parameter WIDTH = 4; // Example width
reg [WIDTH-1:0] dataIn;
reg sel;
wire [WIDTH-1:0] aOut, bOut;

// Instantiate the module under test (uut)
demux1to2 #(WIDTH) uut (
    .dataIn(dataIn),
    .sel(sel),
    .aOut(aOut),
    .bOut(bOut)
);

// Test sequence
initial begin
    // Test case 1: sel = 0, dataIn = 4'b1010
    dataIn = 4'b1010; sel = 0;
    #10;
    if (aOut !== 4'b1010 || bOut !== 4'b0000) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: sel = 1, dataIn = 4'b1010
    dataIn = 4'b1010; sel = 1;
    #10;
    if (aOut !== 4'b0000 || bOut !== 4'b1010) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: sel = 0, dataIn = 4'b0000
    dataIn = 4'b0000; sel = 0;
    #10;
    if (aOut !== 4'b0000 || bOut !== 4'b0000) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: sel = 1, dataIn = 4'b0000
    dataIn = 4'b0000; sel = 1;
    #10;
    if (aOut !== 4'b0000 || bOut !== 4'b0000) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: sel = 0, dataIn = 4'b1111
    dataIn = 4'b1111; sel = 0;
    #10;
    if (aOut !== 4'b1111 || bOut !== 4'b0000) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: sel = 1, dataIn = 4'b1111
    dataIn = 4'b1111; sel = 1;
    #10;
    if (aOut !== 4'b0000 || bOut !== 4'b1111) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule