`timescale 1ns/1ps

module tb_maj;
    reg [31:0] x;
    reg [31:0] y;
    reg [31:0] z;
    wire [31:0] o;

    // Instantiate the module under test (uut)
    maj uut (
        .x(x),
        .y(y),
        .z(z),
        .o(o)
    );

    initial begin
        // Test case 1: All inputs are 0
        x = 32'h00000000; 
        y = 32'h00000000; 
        z = 32'h00000000; 
        #10;
        if (o !== 32'h00000000) $display("FAIL: Test case 1 failed");

        // Test case 2: One input is 1
        x = 32'hFFFFFFFF; 
        y = 32'h00000000; 
        z = 32'h00000000; 
        #10;
        if (o !== 32'h00000000) $display("FAIL: Test case 2 failed");

        // Test case 3: Two inputs are 1
        x = 32'hFFFFFFFF; 
        y = 32'hFFFFFFFF; 
        z = 32'h00000000; 
        #10;
        if (o !== 32'hFFFFFFFF) $display("FAIL: Test case 3 failed");

        // Test case 4: All inputs are 1
        x = 32'hFFFFFFFF; 
        y = 32'hFFFFFFFF; 
        z = 32'hFFFFFFFF; 
        #10;
        if (o !== 32'hFFFFFFFF) $display("FAIL: Test case 4 failed");

        // Test case 5: Mixed inputs
        x = 32'hAAAAAAAA; 
        y = 32'h55555555; 
        z = 32'hFFFFFFFF; 
        #10;
        if (o !== 32'hFFFFFFFF) $display("FAIL: Test case 5 failed");

        // Test case 6: More mixed inputs
        x = 32'h0F0F0F0F; 
        y = 32'hF0F0F0F0; 
        z = 32'hFFFFFFFF; 
        #10;
        if (o !== 32'hFFFFFFFF) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule