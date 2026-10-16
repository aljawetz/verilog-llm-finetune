`timescale 1ns/1ps

module tb_Edge;

    reg [4:0] current_index;
    reg [3:0] size;
    wire [3:0] out;

    // Instantiate the module under test
    Edge uut (
        .current_index(current_index),
        .size(size),
        .out(out)
    );

    initial begin
        // Test case 1: current_index = 16, size = 4
        current_index = 16; size = 4;
        #10;
        if (out !== 3) $display("FAIL: Expected out = 3 when current_index = 16 and size = 4, got %d", out);

        // Test case 2: current_index = 0, size = 4
        current_index = 0; size = 4;
        #10;
        if (out !== 1) $display("FAIL: Expected out = 1 when current_index = 0 and size = 4, got %d", out);

        // Test case 3: current_index = 8, size = 4
        current_index = 8; size = 4;
        #10;
        if (out !== 1) $display("FAIL: Expected out = 1 when current_index = 8 and size = 4, got %d", out);

        // Test case 4: current_index = 15, size = 4
        current_index = 15; size = 4;
        #10;
        if (out !== 3) $display("FAIL: Expected out = 3 when current_index = 15 and size = 4, got %d", out);

        // Test case 5: current_index = 16, size = 8
        current_index = 16; size = 8;
        #10;
        if (out !== 7) $display("FAIL: Expected out = 7 when current_index = 16 and size = 8, got %d", out);

        // Test case 6: current_index = 4, size = 8
        current_index = 4; size = 8;
        #10;
        if (out !== 1) $display("FAIL: Expected out = 1 when current_index = 4 and size = 8, got %d", out);

        // Test case 7: current_index = 15, size = 16
        current_index = 15; size = 16;
        #10;
        if (out !== 15) $display("FAIL: Expected out = 15 when current_index = 15 and size = 16, got %d", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule