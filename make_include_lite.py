#!/usr/local/bin/python3

import os

source_path = 'src/google/protobuf'
dest_path = 'include_lite/google/protobuf'

files = [
    "any.h",
    "arena.h",
    "arena_align.h",
    "arena_allocation_policy.h",
    "arena_cleanup.h",
    "arena_config.h",
    "arenastring.h",
    "arenaz_sampler.h",
    "endian.h",
    "explicitly_constructed.h",
    "extension_set.h",
    "extension_set_inl.h",
    "generated_enum_util.h",
    "generated_message_tctable_decl.h",
    "generated_message_tctable_impl.h",
    "generated_message_util.h",
    "has_bits.h",
    "implicit_weak_message.h",
    "inlined_string_field.h",
    "io/coded_stream.h",
    "io/io_win32.h",
    "io/zero_copy_stream.h",
    "io/zero_copy_stream_impl.h",
    "io/zero_copy_stream_impl_lite.h",
    "map.h",
    "map_entry_lite.h",
    "map_field_lite.h",
    "map_type_handler.h",
    "message_lite.h",
    "metadata_lite.h",
    "parse_context.h",
    "port.h",
    "port_def.inc",
    "port_undef.inc",
    "repeated_field.h",
    "repeated_ptr_field.h",
    "serial_arena.h",
    "string_block.h",
    "stubs/callback.h",
    "stubs/common.h",
    "stubs/platform_macros.h",
    "stubs/port.h",
    "stubs/status_macros.h",
    "thread_safe_arena.h",
    "varint_shuffle.h",
    "wire_format_lite.h",
]

for file in enumerate(files):
    print('file: %s' % (file)
