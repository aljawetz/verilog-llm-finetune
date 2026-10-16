`timescale 1ns/1ps

module tb_mux;

    reg [255:0] in;
    reg [7:0] sel;
    wire y;

    // Instantiate the module under test (uut)
    mux uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Select the first bit
        in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001; // in[0] = 1
        sel = 8'b00000000; // Select bit 0
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select the last bit
        in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001; // in[255] = 1
        sel = 8'b11111111; // Select bit 255
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

        // Test case 3: Select a middle bit
        in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010; // in[128] = 1
        sel = 8'b10000000; // Select bit 128
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: Select a bit that is 0
        in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; // all bits are 0
        sel = 8'b00000001; // Select bit 1
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

        // Test case 5: Select another bit that is 0
        in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; // all bits are 0
        sel = 8'b00000010; // Select bit 2
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule