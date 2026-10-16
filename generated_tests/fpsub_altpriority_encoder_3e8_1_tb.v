`timescale 1ns/1ps

module tb_fpsub_altpriority_encoder_3e8;

    reg [1:0] data;
    wire q;
    wire zero;

    // Instantiate the module under test (uut)
    fpsub_altpriority_encoder_3e8 uut (
        .data(data),
        .q(q),
        .zero(zero)
    );

    initial begin
        // Test case 1: Both inputs are low
        data = 2'b00;
        #10;
        if (q !== 1'b0 || zero !== 1'b1) begin
            $display("FAIL: Test case 1 failed (data = %b)", data);
            $finish;
        end

        // Test case 2: First input is high
        data = 2'b01;
        #10;
        if (q !== 1'b0 || zero !== 1'b0) begin
            $display("FAIL: Test case 2 failed (data = %b)", data);
            $finish;
        end

        // Test case 3: Second input is high
        data = 2'b10;
        #10;
        if (q !== 1'b1 || zero !== 1'b0) begin
            $display("FAIL: Test case 3 failed (data = %b)", data);
            $finish;
        end

        // Test case 4: Both inputs are high
        data = 2'b11;
        #10;
        if (q !== 1'b1 || zero !== 1'b0) begin
            $display("FAIL: Test case 4 failed (data = %b)", data);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule