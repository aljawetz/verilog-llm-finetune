`timescale 1ns/1ps

module tb_bidirectional_buffer;

reg sender_port;
reg sender_in;
reg reciever_in;
wire sender_out;
wire reciever_out;

// Instantiate the unit under test (uut)
bidirectional_buffer uut (
    .sender_port(sender_port),
    .sender_in(sender_in),
    .sender_out(sender_out),
    .reciever_in(reciever_in),
    .reciever_out(reciever_out)
);

// Test sequence
initial begin
    // Test case 1: sender_port = 1, sender_in = 1
    sender_port = 1;
    sender_in = 1;
    reciever_in = 0; // irrelevant when sender_port is 1
    #10;
    if (reciever_out !== 1) begin
        $display("FAIL: Test case 1 failed, expected reciever_out = 1, got %b", reciever_out);
        $finish;
    end

    // Test case 2: sender_port = 1, sender_in = 0
    sender_in = 0;
    #10;
    if (reciever_out !== 0) begin
        $display("FAIL: Test case 2 failed, expected reciever_out = 0, got %b", reciever_out);
        $finish;
    end

    // Test case 3: sender_port = 0, reciever_in = 1
    sender_port = 0;
    reciever_in = 1;
    #10;
    if (sender_out !== 1) begin
        $display("FAIL: Test case 3 failed, expected sender_out = 1, got %b", sender_out);
        $finish;
    end

    // Test case 4: sender_port = 0, reciever_in = 0
    reciever_in = 0;
    #10;
    if (sender_out !== 0) begin
        $display("FAIL: Test case 4 failed, expected sender_out = 0, got %b", sender_out);
        $finish;
    end

    // Test case 5: sender_port = 0, reciever_in = 1, sender_in = 1 (should not affect sender_out)
    sender_port = 0;
    sender_in = 1; // irrelevant when sender_port is 0
    reciever_in = 1;
    #10;
    if (sender_out !== 1) begin
        $display("FAIL: Test case 5 failed, expected sender_out = 1, got %b", sender_out);
        $finish;
    end

    // Test case 6: sender_port = 1, sender_in = 1, reciever_in = 0 (should not affect reciever_out)
    sender_port = 1;
    sender_in = 1;
    reciever_in = 0; // irrelevant when sender_port is 1
    #10;
    if (reciever_out !== 1) begin
        $display("FAIL: Test case 6 failed, expected reciever_out = 1, got %b", reciever_out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule